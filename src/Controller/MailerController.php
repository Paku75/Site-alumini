<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

class MailerController extends AbstractController
{
    /**
     * @Route("/mailer", name="mailer")
     */
    public function sendEmail(MailerInterface $mailer)
    {
        $email = (new Email())
            ->from('iticalumni@gmail.com')
            ->to('ptquyen2957@gmail.com')
            //->cc('ptquen2957@gmail.com')
            //->bcc('bcc@example.com')
            //->replyTo('fabien@example.com')
            //->priority(Email::PRIORITY_HIGH)
            ->subject('Email envoyé depuis symfony!')
            ->html('
			
			<p>Bonjour  </p>
			<p>I\'m THE KING </p>
			
			');

        $mailer->send($email);
		 return $this->redirectToRoute('security_registrationOk');
    }
}
