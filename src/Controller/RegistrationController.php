<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\User;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

use App\Form\RegistrationType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;


class RegistrationController extends AbstractController
{
    /**
     * @Route("/inscription", name="registration_registration")
     */
    public function registration(Request $request, EntityManagerInterface $manager)
    {
        $user = new User();
        
        // $form = $this->createForm(RegistrationType::class, $user);

        $form = $this->createFormBuilder($user)
            ->add('nom')
            ->add('prenom')
            ->add('login')
            ->add('email', EmailType::class,[
			 'invalid_message' => 'Adresse email invalide'],)
            ->add('mdp', RepeatedType::class, [
    'type' => PasswordType::class,
    'invalid_message' => 'Mot de passe non identiques',
    'options' => ['attr' => ['class' => 'input-box']],
    'required' => true,
])
        ->getForm();

$form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $manager->persist($user);
            $manager->flush();

            return $this->redirectToRoute('security_login');
        }

        return $this->render('registration/registration.html.twig', [
            'formInscription' => $form->createView()
        ]);
    }

    
    /**
     * @Route("/registrationOk", name="security_registrationOk")
     */
    public function registrationOk()
    {
		return $this->render('registration/registrationOk.html.twig');
	}
}
