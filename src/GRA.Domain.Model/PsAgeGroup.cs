﻿using System.ComponentModel.DataAnnotations;

namespace GRA.Domain.Model
{
    public class PsAgeGroup : Abstract.BaseDomainEntity
    {
        [MaxLength(255)]
        [Required]
        public string Name { get; set; }
    }
}