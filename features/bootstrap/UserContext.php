<?php

use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\RawMinkContext;
use Behat\Symfony2Extension\Context\KernelDictionary;

/**
 * Behat context class.
 */
class UserContext extends RawMinkContext implements SnippetAcceptingContext
{
    use KernelDictionary;

    public function setKernel($kernel)
    {
        $this->kernel = $kernel;
    }

    /**
     * @Given there is no user on site with username :arg1
     */
    public function thereIsNoUserOnSiteWithUsername($username)
    {
        $userRepo = $this->getEntityManager()->getRepository('NullDevUserBundle:User');
        $user     = $userRepo->findOneByUsername($username);

        if ($user) {
            $this->getEntityManager()->remove($user);
            $this->getEntityManager()->flush();
        }
    }

    /**
     * @Given there is a user with username :arg1
     */
    public function thereIsAUserWithUsername($username)
    {
        $userRepo = $this->getEntityManager()->getRepository('NullDevUserBundle:User');
        $user     = $userRepo->findOneByUsername($username);

        if (!$user) {
            $msg = "No user with username '$username' found";
            throw new \Exception($msg);
        }
    }

    /**
     * Returns the Doctrine entity manager.
     *
     * @return Doctrine\ORM\EntityManager
     */
    protected function getEntityManager()
    {
        return $this->getContainer()->get('doctrine')->getManager();
    }

}
