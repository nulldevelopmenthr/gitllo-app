<?php

use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;

/**
 * Behat context class.
 */
class FeatureContext extends MinkContext implements SnippetAcceptingContext
{
    private $output;

    /**
     * Initializes context.
     *
     * Every scenario gets its own context object.
     * You can also pass arbitrary arguments to the context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Then I should see :text in the output
     */
    public function iShouldSeeInTheOutput($text)
    {
        if (strpos($this->output, $text) === false) {
            throw new \Exception('Could not find text '.$text);
        }
    }

    /**
     * @When I click :text
     */
    public function iClick($text)
    {
        $this->clickLink($text);
    }

    /**
     * @When I click the plus icon
     */
    public function iClickThePlusIcon()
    {
        $icon = $this->getSession()->getPage()->find('css', '.icon-plus-sign');
        if (!$icon) {
            throw new \Exception('Could not find a plus icon on this page!');
        }

        $icon->getParent()->click();
    }

    /**
     * Checks, that URL is equal to specified.
     *
     * @Then /^url is "(?P<url>[^"]+)"$/
     */
    public function assertUrl($url)
    {
        $expectedUrl = $this->locatePath($url);

        $actualUrl = $this->getSession()->getCurrentUrl();

        if ($expectedUrl !== $actualUrl) {
            $msg = sprintf('Current url is "%s", but "%s" expected.', $actualUrl, $expectedUrl);
            throw new \Exception($msg);
        }
    }

}
