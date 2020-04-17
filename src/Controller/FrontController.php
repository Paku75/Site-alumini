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
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;



class FrontController extends AbstractController
{
	
	 /**
     * @Route("/", name="home")
     */
    public function home()
    {
		return $this->render('front/home.html.twig');
	}
	
	
    /**
     * @Route("/rgpd-communitic", name="rgpd")
     */
    public function registrationRgpd()
    {
        return $this->render('front/rgpd.html.twig');
    }
	
	/**
     * @Route("/contactez-nous", name="contact")
     */
    public function contact()
    {
        return $this->render('front/contact.html.twig');
    }
	
	/**
     * @Route("/communitic", name="about")
     */
    public function about()
    {
        return $this->render('front/about.html.twig');
    }
	
	/**
     * @Route("/blogs", name="blogs")
     */
    public function blogs()
    {
        return $this->render('front/404.html.twig');
    }
	
	/**
     * @Route("/annuaire", name="annuaire")
     */
    public function annuaire()
    {
        return $this->render('front/404.html.twig');
    }
	
	/**
     * @Route("/faq", name="faq")
     */
    public function faq()
    {
        return $this->render('front/404.html.twig');
    }
	
	/**
     * @Route("/events", name="events")
     */
    public function events()
    {
        return $this->render('front/404.html.twig');
    }
	
	/**
     * @Route("/nos-offres", name="offres")
     */
    public function offres()
    {
        return $this->render('front/404.html.twig');
    }
	
	/**
     * @Route("/mon-profil", name="profil")
     */
    public function profil()
    {
        return $this->render('front/profil.html.twig');
    }

}
