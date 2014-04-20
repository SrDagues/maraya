package maraya.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Paciente;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(UsuariosPacientes.class)
public class UsuariosPacientes_ { 

    public static volatile SingularAttribute<UsuariosPacientes, Integer> id;
    public static volatile SingularAttribute<UsuariosPacientes, Paciente> paciente;
    public static volatile SingularAttribute<UsuariosPacientes, String> user;
    public static volatile SingularAttribute<UsuariosPacientes, String> password;

}