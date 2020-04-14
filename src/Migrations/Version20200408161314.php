<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200408161314 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE annuaire (id INT AUTO_INCREMENT NOT NULL, promotion VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE classe_annuaire (classe_id INT NOT NULL, annuaire_id INT NOT NULL, INDEX IDX_7FA56FA58F5EA509 (classe_id), INDEX IDX_7FA56FA55132B86A (annuaire_id), PRIMARY KEY(classe_id, annuaire_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE classe_annuaire ADD CONSTRAINT FK_7FA56FA58F5EA509 FOREIGN KEY (classe_id) REFERENCES classe (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE classe_annuaire ADD CONSTRAINT FK_7FA56FA55132B86A FOREIGN KEY (annuaire_id) REFERENCES annuaire (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE classe_annuaire DROP FOREIGN KEY FK_7FA56FA55132B86A');
        $this->addSql('DROP TABLE annuaire');
        $this->addSql('DROP TABLE classe_annuaire');
    }
}
