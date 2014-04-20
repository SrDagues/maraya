package maraya.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Gruposmedicos;
import maraya.entity.Historial;
import maraya.entity.UsuariosPacientes;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(Paciente.class)
public class Paciente_ { 

    public static volatile SingularAttribute<Paciente, String> nombre;
    public static volatile SingularAttribute<Paciente, Historial> historial;
    public static volatile SingularAttribute<Paciente, String> apellidos;
    public static volatile SingularAttribute<Paciente, String> nss;
    public static volatile CollectionAttribute<Paciente, Gruposmedicos> gruposmedicosCollection;
    public static volatile SingularAttribute<Paciente, String> dni;
    public static volatile SingularAttribute<Paciente, Date> fechaNacimiento;
    public static volatile CollectionAttribute<Paciente, UsuariosPacientes> usuariosPacientesCollection;

}