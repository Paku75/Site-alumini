<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;

class UserController extends AbstractController
{
    /**
     * @Route("/user", name="user")
     */
    public function index(UserRepository $repo)
    {
        $users = $repo->findAll();
        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
            'users'=> $users
        ]);
    }

    /**
     * @Route("/user/new", name="user_create")
     * @Route("/user/{id}/edit", name="user_edit")
     */
    public function form(User $user = null, Request $request, EntityManagerInterface $manager)
    {
        if(!$user) 
        {
            $user = new user();
            $user->setNom("Nom")
                ->setPrenom("Prenom")
                ->setEmail("example@gmail.com")
                ->setAdresse("Adresse")
                ->setVille("Ville");
        }

        $form = $this->createFormBuilder($user)
                     ->add('nom', null, array('label' => false))
                     ->add('prenom', null, array('label' => false))
                     ->add('email', null, array('label' => false))
                     ->add('tel', null, array('label' => false))
                     ->add('date_naissance', null, array('label' => false))
                     ->add('adresse', null, array('label' => false))
                     ->add('cp', null, array('label' => false))
                     ->add('ville', null, array('label' => false))
                     ->add('login', null, array('label' => false))
                     ->add('mdp', null, array('label' => false))
                     ->add('etat', null, array('label' => false), CheckboxType::class, [
                        'required' => false,
                    ])
                     ->getForm();
        
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($user);
            $manager->flush();

            return $this->redirectToRoute('user_show', ['titre' => $user->getId()]);
        }

        return $this->render('user/create.html.twig', [
            'formUser' => $form->createView(),
            'editMode' => $user->getId() !== null
        ]);
    }

    /**
     * @Route("/user/{id}", name="user_show")
     */
    public function show(User $user) 
    {
        return $this->render('user/show.html.twig', [
            'user' => $user
        ]);
    }

    /**
     * @Route("/user/delete/{id}", name="user_delete")
     */
    public function delete(User $user, EntityManagerInterface $manager)
    {   
        $manager->remove($user);
        $manager->flush();
        return $this->redirectToRoute('user');
    }
}
