<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ClasseRepository")
 */
class Classe
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nom;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Filliere", inversedBy="classes")
     * @ORM\JoinColumn(nullable=false)
     */
    private $filliere;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Annuaire", inversedBy="classes")
     */
    private $promotion;

    public function __construct()
    {
        $this->promotion = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getFilliere(): ?Filliere
    {
        return $this->filliere;
    }

    public function setFilliere(?Filliere $filliere): self
    {
        $this->filliere = $filliere;

        return $this;
    }

    /**
     * @return Collection|Annuaire[]
     */
    public function getPromotion(): Collection
    {
        return $this->promotion;
    }

    public function addPromotion(Annuaire $promotion): self
    {
        if (!$this->promotion->contains($promotion)) {
            $this->promotion[] = $promotion;
        }

        return $this;
    }

    public function removePromotion(Annuaire $promotion): self
    {
        if ($this->promotion->contains($promotion)) {
            $this->promotion->removeElement($promotion);
        }

        return $this;
    }
}
