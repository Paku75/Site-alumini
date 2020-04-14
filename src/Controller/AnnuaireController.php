<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Annuaire;
use App\Repository\AnnuaireRepository;

class AnnuaireController extends AbstractController
{
    /**
     * @Route("/annuaire", name="annuaire")
     */
    public function index(AnnuaireRepository $repo)
    {
        $annuaires = $repo->findAll();
        return $this->render('classe/index.html.twig', [
            'controller_name' => 'AnnuaireController',
            'annuaires'=> $annuaires
        ]);
    }
}
