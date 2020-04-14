<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\Article;
use App\Entity\Blog;
use App\Entity\Commentaire;

class ArticleFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $faker = \Faker\Factory::create('fr_FR');

        // Créer 3 catégories fakes
        for($i = 1; $i <= 3; $i++) 
        {
            $blog = new Blog();
            $blog->setTitre($faker->sentence())
                 ->setDescription($faker->paragraph());
            $manager->persist($blog);

            // Créer entre 4 et 6 articles 
            for($j = 1; $j <= mt_rand(4, 6); $j++){
                $article = new Article();

                // $content = '<p>' . join($faker->sentence(5), '</p><p>') . '</p>';

                $article->setTitre($faker->sentence())
                        ->setContenu($faker->sentence())
                        ->setCreatedAt($faker->dateTimeBetween('-6 months'))
                        ->setImageMin($faker->imageUrl($width = 100, $height = 80))
                        ->setImage($faker->imageUrl($width = 300, $height = 250))
                        ->setBlog($blog);

                $manager->persist($article);
                
                // Créer entre 4 et 10 commentaires
                for($k = 1; $k <= mt_rand(4,10); $k++)
                {
                    $commentaire = new Commentaire();

                    // $content = '<p>' . join($faker->paragraphs(2), '</p><p>').'</p>';

                    $now = new \DateTime();
                    $interval = $now->diff($article->getCreatedAt());
                    $days = $interval->days;
                    $minimum = '-' . $days . ' days'; // -100 days

                    $commentaire->setUser($faker->name)
                                ->setContenu($faker->sentence())
                                ->setCreatedAt($faker->dateTimeBetween($minimum))
                                ->setArticle($article);

                    $manager->persist($commentaire);    
                }
            }   
        }

            

        $manager->flush();
    }
}
