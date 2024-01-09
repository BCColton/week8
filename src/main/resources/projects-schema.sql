USE projects;

DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project
	(project_id INT NOT NULL, project_name VARCHAR(20) NOT NULL, estimated_hours INT,
	 actual_hours INT, difficulty CHAR(1), notes VARCHAR(200), PRIMARY KEY(project_id));
CREATE TABLE category
	(category_id INT NOT NULL, category_name VARCHAR(20), PRIMARY KEY(category_id));
CREATE TABLE project_category
	(project_id INT NOT NULL, category_id INT NOT NULL, 
     FOREIGN KEY(project_id) REFERENCES project(project_id) ON DELETE CASCADE, 
     FOREIGN KEY(category_id) REFERENCES category(category_id) ON DELETE CASCADE);
CREATE TABLE material
	(material_id INT NOT NULL, project_id INT NOT NULL, material_name VARCHAR(50),
     num_required INT, cost DECIMAL(6,2), PRIMARY KEY(material_id), 
     FOREIGN KEY(project_id) REFERENCES project(project_id));
CREATE TABLE step
	(step_id INT NOT NULL, project_id INT NOT NULL, step_text VARCHAR(200), step_order INT,
     PRIMARY KEY(step_id),
     FOREIGN KEY(project_id) REFERENCES project(project_id));