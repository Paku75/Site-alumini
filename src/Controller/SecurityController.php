<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\User;

use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

class SecurityController extends AbstractController
{
    /**
     * @Route("/inscription", name="registration_registration")
     */
    public function registration(Request $request, EntityManagerInterface $manager, MailerInterface $mailer)
    {
        $user = new User();

        // $form = $this->createForm(RegistrationType::class, $user);

        $form = $this->createFormBuilder($user)
            ->add('nom')
            ->add('prenom')
            ->add('login')
            ->add(
                'email',
                EmailType::class,
                [
                    'invalid_message' => 'Adresse email invalide'
                ],

            )
            ->add('mdp', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Mot de passe non identiques',
                'options' => ['attr' => ['class' => 'input-box']],
                'required' => true,
            ])
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($user);
            $manager->flush();
            $nom = $form['nom']->getData();
            $prenom = $form['prenom']->getData();
            $mail = $form['email']->getData();
            $login = $form['login']->getData();
            $mdp = $form['mdp']->getData();
            $email = (new Email())
                ->from('iticalumni@gmail.com')
                ->to($mail)
                //->cc('ptquen2957@gmail.com')
                //->bcc('bcc@example.com')
                //->replyTo('fabien@example.com')
                //->priority(Email::PRIORITY_HIGH)
                ->subject('Confirmation d\'inscription sur COMMUNITIC ')
                ->html("<h3>Bonjour {$nom} {$prenom}</h3>
			<p>
			   <b>Félicitaions</b>, vous êtes inscrit au site web des anciens étudiants de l'école ITIC Paris
			</p>
			<p>Votre login est : {$login}</p>

			
			<p>
				Mot de passe: {$mdp}
			</p><br/>
			<p>Vous pouvez dès maintenant vous connecter sur notre site et compléter votre profil</p>
			<p>L'équipe COMMUN'ITIC vous souhaite une agréable journée ! <p>
			<p>A très bientôt sur notre site communitic.com </p>
			<h5>PS: Soyez vigilants et ne communiquez pas ces données à personne</h5>

			
			");

            $mailer->send($email);
            return $this->redirectToRoute('security_registrationOk');
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

    /**
     * @Route("/termsofuse", name="registration_rgpd")
     */
    public function registrationRgpd()
    {
        return $this->render('registration/rgpd.html.twig');
    }

    /**
     * @Route("/login", name="security_login")
     */
    public function login()
    {
        return $this->render('security/login.html.twig');
    }

    /**
     * @Route("/logout", name="security_logout")
     */
    public function logout()
    {
    }

    /**
     * @Route("/reset-password", name="security_reset")
     */
    public function resetPwd()
    {
    }
}
