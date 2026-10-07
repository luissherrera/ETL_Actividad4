USE [BD_ETL_Actividad4]
GO
/****** Objeto: Table [dbo].[Cursor_Aceptados] Fecha de script: 6/10/2026 10:43:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursor_Aceptados](
	[SourceRowId] [nvarchar](100) NULL,
	[DocumentType] [nvarchar](100) NULL,
	[DocumentNumber] [nvarchar](200) NULL,
	[FirstName] [nvarchar](400) NULL,
	[MiddleName] [nvarchar](400) NULL,
	[LastName] [nvarchar](400) NULL,
	[SecondLastName] [nvarchar](400) NULL,
	[BirthDate] [nvarchar](200) NULL,
	[ReportedAge] [nvarchar](100) NULL,
	[Sex] [nvarchar](100) NULL,
	[MonthlyIncome] [decimal](18, 2) NULL,
	[MonthlyExpenses] [decimal](18, 2) NULL,
	[MonthlyBalance] [decimal](18, 2) NULL,
	[SurveyDate] [nvarchar](200) NULL,
	[FechaProcesamiento] [datetime] NULL
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Cursor_Rechazados] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursor_Rechazados](
	[SourceRowId] [nvarchar](100) NULL,
	[DocumentType] [nvarchar](100) NULL,
	[DocumentNumber] [nvarchar](200) NULL,
	[FirstName] [nvarchar](400) NULL,
	[LastName] [nvarchar](400) NULL,
	[MonthlyIncomeOriginal] [nvarchar](200) NULL,
	[MonthlyExpensesOriginal] [nvarchar](200) NULL,
	[MotivoRechazo] [nvarchar](1000) NULL,
	[FechaProcesamiento] [datetime] NULL
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimEducacion] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEducacion](
	[EducacionKey] [int] IDENTITY(1,1) NOT NULL,
	[EducacionId] [int] NOT NULL,
	[EducationLevel] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EducacionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimFecha] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFecha](
	[FechaKey] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Anio] [int] NOT NULL,
	[Trimestre] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[NombreMes] [nvarchar](20) NOT NULL,
	[Dia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FechaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimPersona] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPersona](
	[PersonaKey] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [int] NOT NULL,
	[DocumentType] [nvarchar](50) NOT NULL,
	[DocumentNumber] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](200) NULL,
	[MiddleName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[SecondLastName] [nvarchar](200) NULL,
	[BirthDate] [date] NULL,
	[ReportedAge] [int] NULL,
	[Sex] [nvarchar](50) NULL,
	[MaritalStatus] [nvarchar](100) NULL,
	[Email] [nvarchar](300) NULL,
	[Phone] [nvarchar](100) NULL,
	[Address] [nvarchar](300) NULL,
	[Zone] [nvarchar](100) NULL,
	[HousingType] [nvarchar](100) NULL,
	[SocioeconomicStratum] [int] NULL,
	[HealthRegime] [nvarchar](100) NULL,
	[Disability] [nvarchar](50) NULL,
	[SourceRowId] [int] NULL,
	[FechaCarga] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimSituacionLaboral] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSituacionLaboral](
	[SituacionLaboralKey] [int] IDENTITY(1,1) NOT NULL,
	[SituacionLaboralId] [int] NOT NULL,
	[EmploymentStatus] [nvarchar](100) NOT NULL,
	[OccupationCode] [nvarchar](50) NULL,
	[OccupationName] [nvarchar](200) NULL,
	[EmployerName] [nvarchar](300) NULL,
	[ContractType] [nvarchar](100) NULL,
	[EmploymentStartDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SituacionLaboralKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[DimUbicacion] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimUbicacion](
	[UbicacionKey] [int] IDENTITY(1,1) NOT NULL,
	[UbicacionId] [int] NOT NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[DepartmentName] [nvarchar](200) NULL,
	[MunicipalityCode] [nvarchar](50) NULL,
	[MunicipalityName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UbicacionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Educacion] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educacion](
	[EducacionId] [int] IDENTITY(1,1) NOT NULL,
	[EducationLevel] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EducacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Educacion] UNIQUE NONCLUSTERED 
(
	[EducationLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[FactPersonas] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPersonas](
	[FactPersonaKey] [int] IDENTITY(1,1) NOT NULL,
	[PersonaKey] [int] NOT NULL,
	[UbicacionKey] [int] NULL,
	[EducacionKey] [int] NULL,
	[SituacionLaboralKey] [int] NULL,
	[FechaKey] [int] NULL,
	[MonthlyIncome] [decimal](18, 2) NULL,
	[MonthlyExpenses] [decimal](18, 2) NULL,
	[MonthlyBalance] [decimal](18, 2) NULL,
	[Dependents] [int] NULL,
	[HouseholdSize] [int] NULL,
	[SourceRowId] [int] NULL,
	[FechaCarga] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[FactPersonaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Observaciones] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observaciones](
	[ObservacionId] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [int] NOT NULL,
	[UbicacionId] [int] NULL,
	[EducacionId] [int] NULL,
	[SituacionLaboralId] [int] NULL,
	[SurveyDate] [date] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[MonthlyIncome] [decimal](18, 2) NULL,
	[MonthlyExpenses] [decimal](18, 2) NULL,
	[MonthlyBalance] [decimal](18, 2) NULL,
	[Dependents] [int] NULL,
	[HouseholdSize] [int] NULL,
	[SourceChannel] [nvarchar](100) NULL,
	[FechaCarga] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ObservacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Observacion_Persona_Fecha] UNIQUE NONCLUSTERED 
(
	[PersonaId] ASC,
	[SurveyDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Personas] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[PersonaId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [nvarchar](50) NOT NULL,
	[DocumentNumber] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](200) NULL,
	[MiddleName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[SecondLastName] [nvarchar](200) NULL,
	[BirthDate] [date] NULL,
	[ReportedAge] [int] NULL,
	[Sex] [nvarchar](50) NULL,
	[MaritalStatus] [nvarchar](100) NULL,
	[Email] [nvarchar](300) NULL,
	[Phone] [nvarchar](100) NULL,
	[Address] [nvarchar](300) NULL,
	[Zone] [nvarchar](100) NULL,
	[HousingType] [nvarchar](100) NULL,
	[SocioeconomicStratum] [int] NULL,
	[HealthRegime] [nvarchar](100) NULL,
	[Disability] [nvarchar](50) NULL,
	[SourceRowId] [int] NULL,
	[FechaCarga] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Personas_Documento] UNIQUE NONCLUSTERED 
(
	[DocumentType] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Personas_Cursor_Aceptadas] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas_Cursor_Aceptadas](
	[IdAceptado] [int] IDENTITY(1,1) NOT NULL,
	[SourceRowId] [int] NOT NULL,
	[DocumentType] [nvarchar](10) NULL,
	[DocumentNumber] [nvarchar](50) NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[SecondLastName] [nvarchar](100) NULL,
	[MonthlyIncome] [decimal](18, 2) NULL,
	[MonthlyExpenses] [decimal](18, 2) NULL,
	[MonthlyBalance] [decimal](18, 2) NULL,
	[FechaProcesamiento] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAceptado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Personas_Cursor_Rechazadas] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas_Cursor_Rechazadas](
	[IdRechazo] [int] IDENTITY(1,1) NOT NULL,
	[SourceRowId] [int] NOT NULL,
	[DocumentNumber] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[MonthlyIncomeOriginal] [nvarchar](100) NULL,
	[MonthlyExpensesOriginal] [nvarchar](100) NULL,
	[MotivoRechazo] [nvarchar](1000) NULL,
	[FechaProcesamiento] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRechazo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[SituacionesLaborales] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SituacionesLaborales](
	[SituacionLaboralId] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentStatus] [nvarchar](100) NOT NULL,
	[OccupationCode] [nvarchar](50) NULL,
	[OccupationName] [nvarchar](200) NULL,
	[EmployerName] [nvarchar](300) NULL,
	[ContractType] [nvarchar](100) NULL,
	[EmploymentStartDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SituacionLaboralId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_SituacionLaboral] UNIQUE NONCLUSTERED 
(
	[EmploymentStatus] ASC,
	[OccupationCode] ASC,
	[OccupationName] ASC,
	[EmployerName] ASC,
	[ContractType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[SSIS_Rechazados] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSIS_Rechazados](
	[RechazoId] [int] IDENTITY(1,1) NOT NULL,
	[SourceRowId] [nvarchar](50) NULL,
	[DocumentType] [nvarchar](50) NULL,
	[DocumentNumber] [nvarchar](100) NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[MotivoRechazo] [nvarchar](500) NULL,
	[FechaRechazo] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[RechazoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Stg_Personas] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Personas](
	[SourceRowId] [nvarchar](50) NULL,
	[DocumentType] [nvarchar](50) NULL,
	[DocumentNumber] [nvarchar](100) NULL,
	[FirstName] [nvarchar](200) NULL,
	[MiddleName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[SecondLastName] [nvarchar](200) NULL,
	[BirthDate] [nvarchar](100) NULL,
	[ReportedAge] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[MaritalStatus] [nvarchar](100) NULL,
	[Email] [nvarchar](300) NULL,
	[Phone] [nvarchar](100) NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[DepartmentName] [nvarchar](200) NULL,
	[MunicipalityCode] [nvarchar](50) NULL,
	[MunicipalityName] [nvarchar](200) NULL,
	[Zone] [nvarchar](100) NULL,
	[Address] [nvarchar](300) NULL,
	[HousingType] [nvarchar](100) NULL,
	[SocioeconomicStratum] [nvarchar](50) NULL,
	[EducationLevel] [nvarchar](100) NULL,
	[EmploymentStatus] [nvarchar](100) NULL,
	[OccupationCode] [nvarchar](50) NULL,
	[OccupationName] [nvarchar](200) NULL,
	[EmployerName] [nvarchar](300) NULL,
	[ContractType] [nvarchar](100) NULL,
	[EmploymentStartDate] [nvarchar](100) NULL,
	[MonthlyIncome] [nvarchar](100) NULL,
	[MonthlyExpenses] [nvarchar](100) NULL,
	[Dependents] [nvarchar](50) NULL,
	[HouseholdSize] [nvarchar](50) NULL,
	[HealthRegime] [nvarchar](100) NULL,
	[Disability] [nvarchar](50) NULL,
	[SurveyDate] [nvarchar](100) NULL,
	[UpdatedAt] [nvarchar](100) NULL,
	[SourceChannel] [nvarchar](100) NULL,
	[FechaCarga] [datetime] NULL
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Ubicaciones] Fecha de script: 6/10/2026 10:43:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicaciones](
	[UbicacionId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[DepartmentName] [nvarchar](200) NULL,
	[MunicipalityCode] [nvarchar](50) NULL,
	[MunicipalityName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UbicacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Ubicaciones] UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC,
	[MunicipalityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cursor_Aceptados] ADD  DEFAULT (getdate()) FOR [FechaProcesamiento]
GO
ALTER TABLE [dbo].[Cursor_Rechazados] ADD  DEFAULT (getdate()) FOR [FechaProcesamiento]
GO
ALTER TABLE [dbo].[FactPersonas] ADD  DEFAULT (sysdatetime()) FOR [FechaCarga]
GO
ALTER TABLE [dbo].[Observaciones] ADD  DEFAULT (sysdatetime()) FOR [FechaCarga]
GO
ALTER TABLE [dbo].[Personas] ADD  DEFAULT (sysdatetime()) FOR [FechaCarga]
GO
ALTER TABLE [dbo].[Personas_Cursor_Aceptadas] ADD  DEFAULT (sysdatetime()) FOR [FechaProcesamiento]
GO
ALTER TABLE [dbo].[Personas_Cursor_Rechazadas] ADD  DEFAULT (sysdatetime()) FOR [FechaProcesamiento]
GO
ALTER TABLE [dbo].[SSIS_Rechazados] ADD  DEFAULT (sysdatetime()) FOR [FechaRechazo]
GO
ALTER TABLE [dbo].[Stg_Personas] ADD  DEFAULT (getdate()) FOR [FechaCarga]
GO
ALTER TABLE [dbo].[FactPersonas]  WITH CHECK ADD  CONSTRAINT [FK_FactPersonas_DimEducacion] FOREIGN KEY([EducacionKey])
REFERENCES [dbo].[DimEducacion] ([EducacionKey])
GO
ALTER TABLE [dbo].[FactPersonas] CHECK CONSTRAINT [FK_FactPersonas_DimEducacion]
GO
ALTER TABLE [dbo].[FactPersonas]  WITH CHECK ADD  CONSTRAINT [FK_FactPersonas_DimFecha] FOREIGN KEY([FechaKey])
REFERENCES [dbo].[DimFecha] ([FechaKey])
GO
ALTER TABLE [dbo].[FactPersonas] CHECK CONSTRAINT [FK_FactPersonas_DimFecha]
GO
ALTER TABLE [dbo].[FactPersonas]  WITH CHECK ADD  CONSTRAINT [FK_FactPersonas_DimPersona] FOREIGN KEY([PersonaKey])
REFERENCES [dbo].[DimPersona] ([PersonaKey])
GO
ALTER TABLE [dbo].[FactPersonas] CHECK CONSTRAINT [FK_FactPersonas_DimPersona]
GO
ALTER TABLE [dbo].[FactPersonas]  WITH CHECK ADD  CONSTRAINT [FK_FactPersonas_DimSituacionLaboral] FOREIGN KEY([SituacionLaboralKey])
REFERENCES [dbo].[DimSituacionLaboral] ([SituacionLaboralKey])
GO
ALTER TABLE [dbo].[FactPersonas] CHECK CONSTRAINT [FK_FactPersonas_DimSituacionLaboral]
GO
ALTER TABLE [dbo].[FactPersonas]  WITH CHECK ADD  CONSTRAINT [FK_FactPersonas_DimUbicacion] FOREIGN KEY([UbicacionKey])
REFERENCES [dbo].[DimUbicacion] ([UbicacionKey])
GO
ALTER TABLE [dbo].[FactPersonas] CHECK CONSTRAINT [FK_FactPersonas_DimUbicacion]
GO
ALTER TABLE [dbo].[Observaciones]  WITH CHECK ADD  CONSTRAINT [FK_Observaciones_Educacion] FOREIGN KEY([EducacionId])
REFERENCES [dbo].[Educacion] ([EducacionId])
GO
ALTER TABLE [dbo].[Observaciones] CHECK CONSTRAINT [FK_Observaciones_Educacion]
GO
ALTER TABLE [dbo].[Observaciones]  WITH CHECK ADD  CONSTRAINT [FK_Observaciones_Personas] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Personas] ([PersonaId])
GO
ALTER TABLE [dbo].[Observaciones] CHECK CONSTRAINT [FK_Observaciones_Personas]
GO
ALTER TABLE [dbo].[Observaciones]  WITH CHECK ADD  CONSTRAINT [FK_Observaciones_Situaciones] FOREIGN KEY([SituacionLaboralId])
REFERENCES [dbo].[SituacionesLaborales] ([SituacionLaboralId])
GO
ALTER TABLE [dbo].[Observaciones] CHECK CONSTRAINT [FK_Observaciones_Situaciones]
GO
ALTER TABLE [dbo].[Observaciones]  WITH CHECK ADD  CONSTRAINT [FK_Observaciones_Ubicaciones] FOREIGN KEY([UbicacionId])
REFERENCES [dbo].[Ubicaciones] ([UbicacionId])
GO
ALTER TABLE [dbo].[Observaciones] CHECK CONSTRAINT [FK_Observaciones_Ubicaciones]
GO

