<?php

namespace Tests\Feature;

use Tests\TestCase;

class LandingPageTest extends TestCase
{
    public function test_the_root_route_redirects_to_login(): void
    {
        $this->get('/')
            ->assertRedirect('/login');
    }
}
