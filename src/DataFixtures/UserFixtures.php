<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Persistence\ObjectManager;
use App\Entity\User;

class UserFixtures extends Fixture implements FixtureGroupInterface
{
    public function load(ObjectManager $manager)
        {
            $faker = \Faker\Factory::create('fr_FR');

            for($i = 1; $i <= 20; $i++) 
            {
                $user = new User();
                $user->setNom($faker->lastName())
                     ->setPrenom($faker->firstName())
                     ->setAdresse($faker->streetAddress())
                     ->setVille($faker->city())
                     ->setEmail($faker->safeEmail())
                     ->setEtat(0)
                     ->setLogin($faker->lastName())
                     ->setMdp($faker->word());
                $manager->persist($user);
            }
            $manager->flush();
        }
    public static function getGroups(): array
    {
        return ['group1'];    
    }
    
}
