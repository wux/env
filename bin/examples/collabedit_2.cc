Implement a programmable state machine in a software language of your choice.

 1. The machine must allow the programmer to define an arbitrary set of named states.
 2. The machine must provide a method to move to any named state from its current state.
 3. The machine must allow the programmer to define arbitrary pre and post conditions for state transitions.
 4. State transitions must be atomic, consistent, and isolated.

class ad_matrix {
     public:
      ad_matrix(int num_nodes);
      virtual~ ad_matrix();
  
      void set_pre(int pre_node, int node);
      void set_post(int node, int post_node);
  
      bool is_connected_from_to(int from_node, int to_node) const;
      // Return the number of convolution we did for the initialization.
      int init_admatrix();
  
     private:
      // row i col j == a directed edge from i to j.
      int* matrix_;  
      int  num_node_; 
    }
 
  class state_machine {
   public:
    state_machine(int num_states, const ad_matrix& matrix, int init_state);
    virtual~ state_machine();
  
    int current_state() const;
    bool jump_to_state(int target_state);
  
   private:
    int state_; 
  }
    /// in .cc file.
    ad_matrix::ad_matrix(int num_nodes) {
      num_nodes_ = num_nodes;
      matrix_ = new int[num_nodes * num_nodes];
      memset(matrix_, 0, num_nodes * num_nodes * sizeof(int));
    }

ad_matrix::~ad_matrix() {
  delete [] matrix_;
}

void ad_matrix::set_pre(int pre_node, int node) {
  int index = pre_node * num_nodes_ + node;
  matrix_[index] = 1; 
}

void ad_matrix::set_post(int node, int post_node) {
  int index = node * num_nodes_ + post_node;
  matrix_[index] = 1;
}

bool ad_matrix::is_connected_from_to(int from_node, int to_node) const {
  return matrix_[from_node * num_nodes_ + to_node] > 0;
}

static int sum_norm(int* matrix, int num_nodes, int row, int col) {
  int result = 0;
  for (int i = 0; i < num_nodes; ++i) {
    result += matrix[row * num_nodes + i] & matrix[i * num_nodes + col];
  }
  return result > 0 ? 1 : 0;
}

int ad_matrix::init_admatrix() {
  int num_con = 0;
  bool has_change = false;
  do {
    has_change = false;
    for (int row = 0; row < num_nodes_; ++row) {
      for (int col = 0; col < num_nodes_; ++col) {
        int tmp = sum_norm(matrix_, num_nodes_, row, col);
        if (tmp != matrix_[row * num_nodes_ + col]) 
          has_change = true;
        matrix_[row * num_nodes_ + col] = tmp;
      } 
    } 
    if (has_change) 
      num_con++;
  } while (has_change);
  return num_con;
};
