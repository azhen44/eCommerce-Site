describe('Jungle Home Page Tests', () => {
  beforeEach(() => {
        cy.visit('localhost:3000')
  })

  xit('displays Welcome to The Jungle', () => {
    cy.get('.hero').contains("Welcome to The Jungle")
  })

  xit("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})
