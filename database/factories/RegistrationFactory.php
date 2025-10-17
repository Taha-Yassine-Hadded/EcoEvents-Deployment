<?php

namespace Database\Factories;

use App\Models\Event;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class RegistrationFactory extends Factory
{
    public function definition(): array
    {
        return [
            'event_id'      => Event::factory(),
            'user_id'       => User::factory(),
            'status'        => $this->faker->randomElement(['registered', 'attended', 'cancelled', 'no-show']),
            'registered_at' => $this->faker->dateTimeBetween('-1 months', 'now'),
        ];
    }
}
