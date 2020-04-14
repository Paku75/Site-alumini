<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;

use App\Entity\Blog;
use App\Repository\BlogRepository;

class BlogController extends AbstractController
{
    /**
     * @Route("/blog", name="blog")
     */
    public function index(BlogRepository $repo)
    {
        $blogs = $repo->findAll();
        return $this->render('blog/index.html.twig', [
            'controller_name' => 'BlogController',
            'blogs'=> $blogs
        ]);
    }

    /**
     * @Route("/blog/new", name="blog_create")
     * @Route("/blog/{id}/edit", name="blog_edit")
     */
    public function form(Blog $blog = null, Request $request, EntityManagerInterface $manager)
    {
        if(!$blog) 
        {
            $blog = new Blog();
            $blog->setTitre("Titre d'exemple")
                ->setDescription("Description du blog")
                ->setImageMin("http://placehold.it/100x80")
                ->setImage("http://placehold.it/350x150");
        }

        $form = $this->createFormBuilder($blog)
                     ->add('titre')
                     ->add('description')
                     ->add('imageMin')
                     ->add('image')
                     ->getForm();
        
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($blog);
            $manager->flush();

            return $this->redirectToRoute('blog_show', ['titre' => $blog->getTitre()]);
        }

        return $this->render('blog/create.html.twig', [
            'formBlog' => $form->createView(),
            'editMode' => $blog->getId() !== null
        ]);
    }

    /**
     * @Route("/blog/{titre}", name="blog_show")
     */
    public function show(Blog $blog) 
    {
        return $this->render('blog/show.html.twig', [
            'blog' => $blog
        ]);
    }

    /**
     * @Route("/blog/delete/{id}", name="blog_delete")
     */
    public function delete(Blog $blog, EntityManagerInterface $manager)
    {   
        $manager->remove($blog);
        $manager->flush();
        return $this->redirectToRoute('blog');
    }

}
