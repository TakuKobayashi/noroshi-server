json.set! "sectors" do
  json.array!(@mst_sectors) do |mst_sector|
    json.extract! mst_sector, :id, :title, :number
    json.set! "quizzes" do
      json.array!(mst_sector.quizzes) do |quiz|
        json.extract! quiz, :title, :number, :correct_index
        json.set! "choices" do
          json.array!(quiz.choices) do |choice|
            json.extract! choice, :title
          end
        end
      end
    end
  end
end
json.set! "enemies" do
  json.array!(@mst_enemies) do |enemy|
    json.extract! enemy, :mst_sector_id, :hp, :attack
    json.category Mst::CyberGrowthEnemy.categories[enemy.category]
  end
end