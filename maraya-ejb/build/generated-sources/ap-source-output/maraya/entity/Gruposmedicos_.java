package maraya.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Medicos;
import maraya.entity.Paciente;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(Gruposmedicos.class)
public class Gruposmedicos_ { 

    public static volatile SingularAttribute<Gruposmedicos, Integer> id;
    public static volatile SingularAttribute<Gruposmedicos, Paciente> paciente;
    public static volatile SingularAttribute<Gruposmedicos, Medicos> medico;

}