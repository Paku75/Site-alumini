<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;

use App\Entity\Article;
use App\Entity\Blog;
use App\Repository\ArticleRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class ArticleController extends AbstractController
{
    /**
     * @Route("/article", name="article")
     */
    public function index(ArticleRepository $repo)
    {
        $articles = $repo->findAll();
        return $this->render('article/index.html.twig', [
            'controller_name' => 'articleController',
            'articles'=> $articles
        ]);
    }

    /**
     * @Route("/article/new", name="article_create")
     * @Route("/article/{id}/edit", name="article_edit")
     */
    public function form(Article $article = null, Request $request, EntityManagerInterface $manager)
    {
        if(!$article) 
        {
            $article = new Article();
            $article->setTitre("Titre d'exemple")
                ->setContenu("Contenu de l'article")
                ->setCreatedAt(new \DateTime())
                ->setImageMin("http://placehold.it/100x80")
                ->setImage("http://placehold.it/350x150");
        }

        $form = $this->createFormBuilder($article)
                     ->add('titre')
                     ->add('blog', EntityType::class, [
                         'class' => Blog::class,
                         'choice_label' => 'titre'
                     ])
                     ->add('contenu')
                     ->add('imageMin')
                     ->add('image')
                     ->getForm();
        
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($article);
            $manager->flush();

            return $this->redirectToRoute('article_show', ['id' => $article->getId()]);
        }

        return $this->render('article/create.html.twig', [
            'formArticle' => $form->createView(),
            'editMode' => $article->getId() !== null
        ]);
    }

    /**
     * @Route("/article/{id}", name="article_show")
     */
    public function show(Article $article) 
    {
        return $this->render('article/show.html.twig', [
            'article' => $article
        ]);
    }

    /**
     * @Route("/article/delete/{id}", name="article_delete")
     */
    public function delete(Article $article, EntityManagerInterface $manager)
    {   
        $manager->remove($article);
        $manager->flush();
        return $this->redirectToRoute('article');
    }
}
