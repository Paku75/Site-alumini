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
            ->to('bmlaghui@gmail.com')
            //->cc('cc@example.com')
            //->bcc('bcc@example.com')
            //->replyTo('fabien@example.com')
            //->priority(Email::PRIORITY_HIGH)
            ->subject('Email envoyé depuis symfony!')
            ->html('<p>YES ! DONE <3 </p>');

        $mailer->send($email);
		 return $this->redirectToRoute('security_registrationOk');
    }
}
