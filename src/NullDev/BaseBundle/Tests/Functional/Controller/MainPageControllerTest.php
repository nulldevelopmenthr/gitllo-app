<?php

namespace NullDev\BaseBundle\Tests\Functional\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class MainPageControllerTest extends WebTestCase
{
    public function testIndex()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/');

        $this->assertTrue($crawler->filter('html:contains("Hello, world!")')->count() > 0);
        $this->assertTrue($crawler->filter('html:contains("Heading")')->count() > 0);
    }
}
