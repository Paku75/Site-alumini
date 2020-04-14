<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Filliere;
use App\Repository\FilliereRepository;

class FilliereController extends AbstractController
{
    /**
     * @Route("/filliere", name="filliere")
     */
    public function index(FilliereRepository $repo)
    {
        $filliere = $repo->findAll();
        return $this->render('filliere/index.html.twig', [
            'controller_name' => 'FilliereController',
            'fillieres'=> $filliere
        ]);
    }

    /**
     * @Route("/filliere/{nom}", name="filliere_show")
     */
    public function show(Filliere $filliere) 
    {
        return $this->render('filliere/show.html.twig', [
            'filliere' => $filliere
        ]);
    }
}
