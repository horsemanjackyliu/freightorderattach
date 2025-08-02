
// const { OrchestrationClient, buildAzureContentSafetyFilter } = require('@sap-ai-sdk/orchestration');
const { OrchestrationClient, buildAzureContentSafetyFilter } = require('../esm/bundle');
// const { AzureOpenAiEmbeddingClient } = require('@sap-ai-sdk/langchain');
const { AzureOpenAiEmbeddingClient } = require('../esm/bundle');

// import { TextLoader } from 'langchain/document_loaders/fs/text'
const { TextLoader } = require('langchain/document_loaders/fs/text');
// import { RecursiveCharacterTextSplitter } from '@langchain/textsplitters'
const { RecursiveCharacterTextSplitter } = require('@langchain/textsplitters');
// import path from 'path'
const { path } = require('path');

// import cds from '@sap/cds'
const cds = require('@sap/cds');

const { DocumentChunks } = cds.entities
const { SELECT } = cds.ql

const chatModelName = 'gpt-4o-mini'
const embeddingModelName = 'text-embedding-3-small'
const resourceGroup = 'default'

async function createVectorEmbeddings() {
    try {
        const loader = new TextLoader(path.resolve('db/data/demo_grounding.txt'))
        const document = await loader.load()

        const splitter = new RecursiveCharacterTextSplitter({
            chunkSize: 400, // Aim for ~400 characters/tokens
            chunkOverlap: 50, // Include 50 chars of overlap to maintain context
            separators: ['\n\n', '\n', '.', ' ', ''], // Recursive priority: break by paragraph > line > sentence > word > char
        })

        const splitDocuments = await splitter.splitDocuments(document)

        const textSplits = []
        for (const chunk of splitDocuments) {
            textSplits.push(chunk.pageContent)
        }

        const embeddingClient = new AzureOpenAiEmbeddingClient({
            modelName: embeddingModelName,
            maxRetries: 0,
            resourceGroup: resourceGroup,
        })
        const embeddings = await embeddingClient.embedDocuments(textSplits)

        return [embeddings, splitDocuments]
    } catch (error) {
        console.log(
            `Error while creating Vector Embeddings.
      Error: ${error.response}`
        )
        throw error
    }
}


async function suggestBestRoute(shipInfo) {

    const filter = buildAzureContentSafetyFilter({
        Hate: 'ALLOW_SAFE',
        Violence: 'ALLOW_SAFE',
        SelfHarm: 'ALLOW_SAFE',
        Sexual: 'ALLOW_SAFE',
        masking: {
            masking_providers: [
                {
                    type: 'sap_data_privacy_integration',
                    method: 'anonymization',
                    entities: [{ type: 'profile-email' }, { type: 'profile-person' }]
                }
            ]
        }
    });
    const orchestrationClient = new OrchestrationClient(
        {
            llm: {
                model_name: chatModelName,
                model_params: { max_tokens: 1000, temperature: 0.1 },
            },
            templating: {
                template: [
                    {
                        role: 'system',
                        content: `You are an expert of logistic.You have received a user's ship information in JSON. The user need you to suggest a best route based ship JSON information.Please respond in JSON format`,
                    },
                    {
                        role: 'user',
                        content: `{{?question}}`,
                    },
                ],
            },
            filtering: {
                input: {
                    filters: [filter],
                },
                output: {
                    filters: [filter],
                },
            },
            masking: {
                masking_providers: [
                    {
                        type: 'sap_data_privacy_integration',
                        method: 'anonymization',
                        entities: [{ type: 'profile-email' }, { type: 'profile-person' }],
                    },
                ],
            },
        },
        { resourceGroup: resourceGroup }
    )

    const response = await orchestrationClient.chatCompletion({
        inputParams: {
            question: shipInfo
        }
    })

    console.log(`Successfully executed chat completion. ${response.getContent()}`)
    return [shipInfo, response.getContent()]



}

async function orchestrateJobPostingCreation(user_query) {
    try {
        const embeddingClient = new AzureOpenAiEmbeddingClient({
            modelName: embeddingModelName,
            maxRetries: 0,
            resourceGroup: resourceGroup,
        })

        let embedding = await embeddingClient.embedQuery(user_query)
        let splits = await SELECT.from(DocumentChunks).orderBy`cosine_similarity(embedding, to_real_vector(${JSON.stringify(
            embedding
        )})) DESC`

        let text_chunks = splits.slice(0, 3).map((split) => split.text_chunk)

        const filter = buildAzureContentSafetyFilter({
            Hate: 'ALLOW_SAFE',
            Violence: 'ALLOW_SAFE',
            SelfHarm: 'ALLOW_SAFE',
            Sexual: 'ALLOW_SAFE',
            masking: {
                masking_providers: [
                    {
                        type: 'sap_data_privacy_integration',
                        method: 'anonymization',
                        entities: [{ type: 'profile-email' }, { type: 'profile-person' }]
                    }
                ]
            }
        })



        const orchestrationClient = new OrchestrationClient(
            {
                llm: {
                    model_name: chatModelName,
                    model_params: { max_tokens: 1000, temperature: 0.1 },
                },
                templating: {
                    template: [
                        {
                            role: 'system',
                            content: `You are an expert of logistic.
              You are receiving a user query to suggest a best route for the transporation request based on given information of the start location point, end end location point, target delivery date,weight,volumn of the goods and container condition.
              Consider the given context information of freignt ability , location weatcher condition .`,
                        },
                        {
                            role: 'user',
                            content: `Question: {{?question}}, context information: ${text_chunks}`,
                        },
                    ],
                },
                filtering: {
                    input: {
                        filters: [filter],
                    },
                    output: {
                        filters: [filter],
                    },
                },
                masking: {
                    masking_providers: [
                        {
                            type: 'sap_data_privacy_integration',
                            method: 'anonymization',
                            entities: [{ type: 'profile-email' }, { type: 'profile-person' }],
                        },
                    ],
                },
            },
            { resourceGroup: resourceGroup }
        )

        const response = await orchestrationClient.chatCompletion({
            inputParams: {
                question: user_query
            }
        })

        console.log(`Successfully executed chat completion. ${response.getContent()}`)
        return [user_query, response.getContent()]
    } catch (error) {
        console.log(
            `Error while generating Job Posting.
      Error: ${error.response}`
        )
        throw error
    }
}

module.exports = { createVectorEmbeddings, orchestrateJobPostingCreation, suggestBestRoute };