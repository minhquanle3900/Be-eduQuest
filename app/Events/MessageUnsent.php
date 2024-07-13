<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;

class MessageUnsent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $chatId;
    public $classId;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($chatId, $classId)
    {
        $this->chatId = $chatId;
        $this->classId = $classId;
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
        ];
    }
}
