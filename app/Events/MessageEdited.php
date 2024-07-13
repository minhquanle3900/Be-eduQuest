<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use App\Models\Chats;

class MessageEdited
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $chatId;
    public $classId;
    public $chatContent;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($chatId, $classId, $chatContent)
    {
        $this->chatId = $chatId;
        $this->classId = $classId;
        $this->chatContent = $chatContent;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('class.' . $this->classId);
    }

    public function broadcastWith()
    {
        return [
            'chatId' => $this->chatId,
            'chatContent' => $this->chatContent,
        ];
    }
}
