<?php

namespace App\Services;

use GuzzleHttp\Client;

class GPT3Service
{
    protected $client;
    protected $apiKey;

    public function __construct()
    {
        $this->client = new Client();
        $this->apiKey = config('services.gpt3.api_key');
    }

    public function generateText($prompt)
    {
        $response = $this->client->post('https://api.openai.com/v1/completions', [
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->apiKey,
            ],
            'json' => [
                'prompt' => $prompt,
                'max_tokens' => 100,
            ],
        ]);

        return json_decode($response->getBody()->getContents(), true);
    }
}
