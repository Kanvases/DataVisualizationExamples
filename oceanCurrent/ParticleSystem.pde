// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector[] origin;                   // An origin point for where particles are birthed
  PImage img;

  ParticleSystem(int num, PVector[] v, PImage img_) {
    particles = new ArrayList<Particle>();              // Initialize the arraylist
    origin = v;                                   // Store the origin point
    img = img_;
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin[i], img));         // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i); //<>//
      p.run();
      if (p.isDead){
        particles.remove(p);
        addParticle();
      }
    }
  }

  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector[][] dir) {
    // Enhanced loop!!!
    for (Particle p : particles) {
      p.applyForce(dir[int(p.loc.x)][int(p.loc.y)]);
      //println(dir[int(p.loc.x)][int(p.loc.y)]);
    }
  }  

  void addParticle() {
    PVector loc=new PVector(random(1439),random(631));
    particles.add(new Particle(loc, img));
  }
}
